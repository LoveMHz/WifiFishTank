import os
import htmlmin
from jsmin import jsmin
from csscompressor import compress

from SCons.Script import DefaultEnvironment

env = DefaultEnvironment()

with open('src/resources.h', 'w') as resource_header:
    resource_header.write('#include <ESP8266WiFi.h>\n\n')
    resource_header.write('#ifndef RESOURCES_H\n')
    resource_header.write('#define RESOURCES_H\n\n')

    for filename in os.listdir('src/resources'):
        print('src/resources/' + filename)
        resource = open('src/resources/' + filename, 'r')
        resource_text = resource.read()
        resource.close()

        # minify html
        if filename.split('.')[-1] == 'html':
            resource_text = htmlmin.minify(u'' + resource_text)

        # minify html
        if filename.split('.')[-1] == 'js':
            resource_text = jsmin(resource_text)

        # minify css
        if filename.split('.')[-1] == 'css':
            resource_text = compress(resource_text)

        resource_header.write('static const String ' + filename.replace('.', '_') + '("')
        resource_header.write('\\x' + '\\x'.join(x.encode('hex') for x in resource_text) + '");\n')

    resource_header.write('\n#endif\n')
