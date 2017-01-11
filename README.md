# net.vortex-zine.legacy

## Déploiement en production

### Test

```bash
ant deploy -Dprofile=pastishosting

```

### Pour de vrai

```bash
ant deploy -Dprofile=pastishosting -Drsync.options=--delete-after

```
