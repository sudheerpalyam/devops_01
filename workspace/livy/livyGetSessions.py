import json, pprint, requests, textwrap
from requests_kerberos import HTTPKerberosAuth
# https://lxdsydstl-lxe11-s01-epgw0001.s01.oan:8443/gateway/default/livy/v1/sessions 
# lxdsydstl-lxm04-s01-mhm40001.s01.oan:8999/sessions 
host='https://lxdsydstl-lxm04-s01-mhm40001.s01.oan:8999'
data = {'kind': 'spark'}
headers = {'Requested-By': 'd917355','Content-Type': 'application/json'}
auth=HTTPKerberosAuth()
r0 = requests.post(host + '/sessions', data=json.dumps(data), headers=headers,auth=auth)
r0.json()
