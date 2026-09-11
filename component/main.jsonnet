local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();
local params = inv.parameters.csi_external_snapshotter;

assert
  !std.member([ 'openshift4', 'oke' ], inv.parameters.facts.distribution)
  : 'Component must not be enabled on OpenShift, since the snapshot-controller and VolumeSnapshot CRDs are managed by OpenShift';

{
  '00_namespace': kube.Namespace(params.namespace) {
    metadata: {
      name: params.namespace,
    },
  },
}
