# GlusterFS Daemon (Centos7)
[![Circle CI](https://circleci.com/gh/million12/docker-gluster.svg?style=svg)](https://circleci.com/gh/million12/docker-gluster)

This is GluserFS Daeomon onlye Docker Image. Based on CentOS 7 

## Usage

`docker pull million12/gluster`

Or, if you prefer to build it on your own:  
`docker build -t million12/gluster .`

Run the image as daemon:  
`docker run -d --net host --privileged million12/gluster`

### Create new volume
`docker exec -ti docker_id gluster volume create my_volume_name /my/mount_point/brick`  

Now start that volume:  
`docker exec -ti docker_id gluster volume start my_volume_name`

Mount GlusterFS:  
`mount -f glusterfs $GLUSTER_IP:/my_volume_name /my/mount_point/`

## Authors

Author: Marcin Ryzycki (<marcin@m12.io>)  
Author: Przemyslaw Ozgo (<linux@ozgo.info>)  

---

**Sponsored by** [Typostrap.io - the new prototyping tool](http://typostrap.io/) for building highly-interactive prototypes of your website or web app. Built on top of TYPO3 Neos CMS and Zurb Foundation framework.
