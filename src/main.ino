#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>

#include <OneWire.h>
#include <DallasTemperature.h>
#include <SimpleTimer.h>

#include <RGBEffects.h>

#include "secrets.h"
#include "resources.h"

// System Timer
SimpleTimer timer_ubi;
SimpleTimer timer_led;

// Web Server
ESP8266WebServer server(80);

/* GPIO Pins for controlling the RGB LED */
RGBEffects rgbEffects(13, 14, 12);

/* LED Functions */
void updateLED() {
  rgbEffects.update();
}

/* DS18B20 Temp Probe */
#define ONE_WIRE_BUS 2  // GPIO Pin
OneWire oneWire(ONE_WIRE_BUS);
DallasTemperature DS18B20(&oneWire);

WiFiClient client;

float temperature;
void updateUbiTemp() {
  do {
    DS18B20.requestTemperatures();
    temperature = DS18B20.getTempCByIndex(0);
  } while(temperature == 85.0 || temperature == (-127.0));

  // Convert to F
  temperature = (temperature * 1.8) + 32;

  String var = "{\"value\": " + String(temperature) + "}";
  int num = var.length();

  if(client.connect("things.ubidots.com", 80)) {
    delay(100);
    client.println("POST /api/v1.6/variables/" + String(UBI_ID) + "/values HTTP/1.1");
    client.println("Content-Type: application/json");
    client.println("Content-Length: " + String(num));
    client.println("X-Auth-Token: " + String(UBI_TOKEN));
    client.println("Host: things.ubidots.com\n");
    client.print(var);
  }
}

/* Arduino Functions */
void setup(void) {
  Serial.begin(115200);

  // Setup LEDs
  rgbEffects.setEffect(EFFECT_CUBE);

  // Setup Wifi
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

  // Wait for connection
  while(WiFi.status() != WL_CONNECTED) {
    delay(500);
  }

  if(MDNS.begin("esp8266")) {
    Serial.println("MDNS responder started");
  }

  // Set up timer for uploading temp data
  timer_ubi.setInterval(30 * 1000, updateUbiTemp);

  // Set up timer for LED effects
  timer_led.setInterval(200, updateLED);

  server.on("/", [](){
    server.send(200, "text/html", index_html);
  });

  server.on("/update", []() {
    rgb current_rgb = rgbEffects.getLEDsColour();

    for(uint8_t i=0; i<server.args(); i++) {
      if(server.argName(i) == "R")
        current_rgb.r = atoi(server.arg(i).c_str());
      if(server.argName(i) == "G")
        current_rgb.g = atoi(server.arg(i).c_str());
      if(server.argName(i) == "B")
        current_rgb.b = atoi(server.arg(i).c_str());

      if(server.argName(i) == "mode") {
        if(server.arg(i) == "EFFECT_OFF")
          rgbEffects.setEffect(EFFECT_OFF);
        else if(server.arg(i) == "EFFECT_SOLID_RED")
          rgbEffects.setEffect(EFFECT_SOLID_RED);
        else if(server.arg(i) == "EFFECT_SOLID_GREEN")
          rgbEffects.setEffect(EFFECT_SOLID_GREEN);
        else if(server.arg(i) == "EFFECT_SOLID_BLUE")
          rgbEffects.setEffect(EFFECT_SOLID_BLUE);
        else if(server.arg(i) == "EFFECT_SOLID_YELLOW")
          rgbEffects.setEffect(EFFECT_SOLID_YELLOW);
        else if(server.arg(i) == "EFFECT_SOLID_PURPLE")
          rgbEffects.setEffect(EFFECT_SOLID_PURPLE);
        else if(server.arg(i) == "EFFECT_SOLID_VIOLET")
          rgbEffects.setEffect(EFFECT_SOLID_VIOLET);
        else if(server.arg(i) == "EFFECT_SOLID_WHITE")
          rgbEffects.setEffect(EFFECT_SOLID_WHITE);
        else if(server.arg(i) == "EFFECT_RAINBOW")
          rgbEffects.setEffect(EFFECT_RAINBOW);
        else if(server.arg(i) == "EFFECT_FADE")
          rgbEffects.setEffect(EFFECT_FADE);
        else if(server.arg(i) == "EFFECT_CUBE")
          rgbEffects.setEffect(EFFECT_CUBE);
        else if(server.arg(i) == "EFFECT_BLINK")
          rgbEffects.setEffect(EFFECT_BLINK);
        else
          rgbEffects.setEffect(EFFECT_CONST);
      }
    }

    if(rgbEffects.getEffect() == EFFECT_CONST || rgbEffects.getEffect() == EFFECT_BLINK) {
      rgbEffects.setConstLEDsColour(current_rgb);
    }

    updateLED();
    current_rgb = rgbEffects.getLEDsColour();

    server.send(200, "text/html",
      String("{\"R\": ") + String(current_rgb.r) +
      String(",\"G\": ") + String(current_rgb.g) +
      String(",\"B\": ") + String(current_rgb.b) +
      String(",\"mode\": ") + String(rgbEffects.getEffect()) +
      String(",\"temperature\": ") + String(temperature) +
      String("}")
    );
  });

  // TODO: Create generic resource loader
  server.on("/main.js", []() {
    server.send(200, "application/javascript", main_js);
  });

  server.on("/main.css", []() {
    server.send(200, "text/css", main_css);
  });

  server.begin();
}

void loop(void){
  server.handleClient();

  timer_ubi.run();
  timer_led.run();
}
