#!/usr/bin/python

'''
    This code is licensed under the Creative Commons Attribution Non-Commercial License.  
        
    2011 Michael Crosby http://crosbymichael.com
                
    Proper attribution by using the line above.  If you want to use this in a commercial project just ask, send me an email at michael@crosbymichael.com 

    You can read the license here:
    http://creativecommons.org/licenses/by-nc-sa/3.0/us/

'''


import web
import json

urls = ('/(.*)', 'QuickRequest')

app = web.application(urls, globals())

class QuickRequest:

    def GET(self, name):
        web.ctx.status = '401 Unauthorized'
        return
        print 'Url passed: %s' % name
        data = web.input()
        if data:
            encodedJSON = json.dumps(data)
        else:
            encodedJSON = 'No data passed.'
        print 'Data passed: %s' % encodedJSON
        print web.ctx.environ['HTTP_ACCEPT']
        output = 'Url passed is: %s \nrequest data is: %s ' % (name, encodedJSON)
        return output

    def POST(self, name):
        print 'Url passed: %s' % name
        data = web.input()
        if data:
            encodedJSON = json.dumps(data)
        else:
            encodedJSON = 'No data passed.'
        print 'Data passed: %s' % encodedJSON
        output = 'Url passed is: %s \nrequest data is: %s ' % (name, encodedJSON)
        return output

if __name__ == '__main__':app.run()
