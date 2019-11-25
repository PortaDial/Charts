Before installing this chart you need to make sure that you have installed the following repo by adding the codecentric repo:

```bash
$ helm helm repo add codecentric https://codecentric.github.io/helm-charts
```

To install this chart you need to use the following command:

```bash
$ helm install keycloak -f values.yaml codecentric/keycloak
```