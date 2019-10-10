def application(env, start_response):
    start_response('200 OK', [('Contect-type', 'text/html')])
    return [b'Hello World, Hello uWSGI']
    #a
