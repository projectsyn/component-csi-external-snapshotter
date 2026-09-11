local com = import 'lib/commodore.libjsonnet';
local kap = import 'lib/kapitan.libjsonnet';

local inv = kap.inventory();
local params = inv.parameters.csi_external_snapshotter;

com.Kustomization(
  'https://github.com/kubernetes-csi/external-snapshotter/client/config/crd',
  params.manifestVersion,
)
