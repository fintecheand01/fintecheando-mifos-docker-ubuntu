define(['Q', 'underscore', 'mifosX'], function (Q) {
    var components = {
        models: [
            'models.0a3ca269'
        ],
        services: [
            'ResourceFactoryProvider',
            'HttpServiceProvider',
            'AuthenticationService',
            'SessionManager',
            'Paginator',
            'UIConfigService',
            'NotificationResponseHeaderProvider'
        ],
        controllers: [
            'controllers.b66427a3'
        ],
        filters: [
            'filters.61c17440'
        ],
        directives: [
            'directives.7500abbb'
        ]
    };

    return function() {
        var defer = Q.defer();
        require(_.reduce(_.keys(components), function (list, group) {
            return list.concat(_.map(components[group], function (name) {
                return group + "/" + name;
            }));
        }, [
            'routes-initialTasks-webstorage-configuration.fc38bbec'
        ]), function(){
            defer.resolve();
        });
        return defer.promise;
    }
});
