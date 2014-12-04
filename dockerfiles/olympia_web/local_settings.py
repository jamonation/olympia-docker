from settings import *  # noqa


DEBUG = True

# To activate the Django debug toolbar.
INSTALLED_APPS += (
    'debug_toolbar',
    'fixture_magic',
)
DEBUG_TOOLBAR_PATCH_SETTINGS = False  # Prevent DDT from patching the settings.

INTERNAL_IPS = ('127.0.0.1','192.168.59.103',)
MIDDLEWARE_CLASSES += ('debug_toolbar.middleware.DebugToolbarMiddleware',)

# Uncomment to run ES tests (Elasticsearch need to be installed).
#RUN_ES_TESTS = True

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'olympia',
        'HOST': 'mysql',
        'USER': 'olympia_user',
        'PASSWORD': 'olympia',
        'OPTIONS': {'init_command': 'SET storage_engine=InnoDB'},
    },
}

ES_HOSTS = ['elasticsearch:9200']
