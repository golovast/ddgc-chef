# ddgc-chef-new-cookbook

Cookbook for configured ddg community

## Supported Platforms

Ubunuty

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ddgc-chef-new']['perlbew']['perls']</tt></td>
    <td>array</td>
    <td>which perls to install</td>
    <td><tt>none</tt></td>
  </tr>
  <tr>
    <td><tt>['ddgc-chef-new']['perlbew']['modules']</tt></td>
    <td>array</td>
    <td>which modules to install</td>
    <td><tt>none</tt></td>
  </tr>
</table>

## Usage

### ddgc-chef-new::default

Include `ddgc-chef-new` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[ddgc-chef-new::default]"
  ]
}
```

To test with chef-solo, refer to the vendored_cookbook path in the repo. 
To test with packer, run `packer build packer.json
`
## Todo
1. fix the packer file and/or add code install
2. test lvm
3. add serverspec
4. extract more values into attributes
5. optimize nginx config
6. logging on daemontool scripts

## License and Authors

Author:: Arthur Freyman


