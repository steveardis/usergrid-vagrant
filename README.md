
## Prerequisites
* Install [Vagrant](http://docs.vagrantup.com/v2/installation/).
* Install [ChefDK](https://downloads.chef.io/chef-dk/).  This includes  [Berkshelf](http://berkshelf.com/) (also a prerequisite).
* Install the [vagrant-berkshelf](https://github.com/berkshelf/vagrant-berkshelf) plugin: `vagrant plugin install vagrant-berkshelf`
* Install the [vagrant-omnibus](https://github.com/chef/vagrant-omnibus) plugin: `vagrant plugin install vagrant-omnibus`

## Running Usergrid
1. Launch usergrid with `vagrant up`.  This will provision the Usergrid backend on a local VM accessible at `10.33.33.7:8080` and Usergrid portal at `10.33.33.7:80`.  For convenience, localhost ports `8080/80/9000` are forwarded to this IP.
2. Provisioning is complete when you see
   ```
   Chef Run complete in ... seconds
   Skipping removal of unused files from the cache
   Running report handlers
   Report handlers complete

   $
   ```
2. Navigate to the administrative portal at [http://localhost/?api_url=http://localhost:8080/](http://localhost/?api_url=http://localhost:8080/), and login as `superuser/test` to get started using Usergrid.
