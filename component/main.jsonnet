// main template for csi-external-snapshotter
local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();
// The hiera parameters for the component
local params = inv.parameters.csi_external_snapshotter;

// Define outputs below
{
}
