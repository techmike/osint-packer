# OSINT Packer

## Build Image
- Built using python3.7
```python
# Install dependencies
pip install -r requirements.txt
# Build golding image

packer build packer-debian-10.json
```


## Use Image
```python
## List virtual machines
$ vagrant status
Current machine states:

osintdesktopenc           running (virtualbox)
osintdesktop              not created (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.


## Bring up virtual machines
vagrant up osintdesktopenc

```