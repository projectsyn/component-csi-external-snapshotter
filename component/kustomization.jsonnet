local com = import 'lib/commodore.libjsonnet';
local kap = import 'lib/kapitan.libjsonnet';

local inv = kap.inventory();
local params = inv.parameters.csi_external_snapshotter;

com.Kustomization(
  'https://github.com/kubernetes-csi/external-snapshotter/deploy/kubernetes/snapshot-controller',
  params.manifestVersion,
  {
    'registry.k8s.io/sig-storage/snapshot-controller': {
      newTag: params.images['external-snapshotter'].tag,
      newName: '%(registry)s/%(repository)s' % params.images['external-snapshotter'],
    },
  },
  {
    namePrefix: 'syn-csi-',
    namespace: params.namespace,
    labels: [ {
      pairs: {
        'app.kubernetes.io/managed-by': 'commodore',
        'app.kubernetes.io/part-of': 'csi-external-snapshotter',
      },
    } ],
  } + com.makeMergeable(params.kustomizeInput)
)
