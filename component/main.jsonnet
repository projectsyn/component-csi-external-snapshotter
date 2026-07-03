local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();
local params = inv.parameters.csi_external_snapshotter;

{
  '00_namespace': kube.Namespace(params.namespace) {
    metadata: {
      name: params.namespace,
    },
  },
}
