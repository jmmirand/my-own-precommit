## Creación de TOC En Readme

Para la creación de un TOC en el fichero README.md ejecutamos el script
create-md-toc.sh

```
$ sudo curl -o /user/local/bin/create-md-toc.sh
$ ./create-md-toc.sh
```


## Uso como pre-commit

Para la instalación del pre-commit hay que insertar
en el fichero .pre-commit-config.yaml

```yaml
- repo: https://github.com/thlorenz/doctoc
  rev: v2.0.0
  hooks:
  - id: doctoc
```

**Existe un problema no resuelto, se modifica el fichero y siempre acaba con error**
**Debemos modificar el script para saber cuando hay que actualizarlo y cuando no**
