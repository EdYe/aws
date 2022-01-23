SELECT
  resourceId
WHERE
  resourceType = 'AWS::EC2::Instance'
  /*AND tags.tag = 'CREATOR_ID=chichen'*/
  AND tags.tag = 'APP_ID=1914'
  AND configuration.imageId NOT IN (
    'ami-0fe51c6da754c5e1e',
    /*/ihdpops/emr/customami*/
    'ami-0e502360aaf34b8ed',
    /*/ihdpops/emr/customami-Linux-2*/
    'ami-01c29a09a40085d61',
    /*/nimbus/gold/linux/amazon*/
    'ami-0fe51c6da754c5e1e43',
    /*/ihdpops/emr/customami old*/
    'ami-08944f421b0d53a4c'
    /*/ihdpops/emr/customami_emr6*/
  )

SELECT
  resourceId
WHERE
  resourceType = 'AWS::EC2::Instance'
  AND tags.tag = 'CREATOR_ID=jachang'
  AND tags.tag = 'APP_ID=1914'
  AND configuration.imageId NOT IN (
    'ami-0fe51c6da754c5e1e',
    'ami-0e502360aaf34b8ed',
    'ami-01c29a09a40085d61',
    'ami-0fe51c6da754c5e1e43',
    'ami-08944f421b0d53a4c'
  )

SELECT
  resourceId
WHERE
  resourceType = 'AWS::EC2::Instance'
  AND tags.tag = 'CREATOR_ID=chichen'
  AND tags.tag = 'APP_ID=1914'
  AND configuration.imageId NOT IN (
    'ami-0fe51c6da754c5e1e',    #/ihdpops/emr/customami
    'ami-0e502360aaf34b8ed',    #/ihdpops/emr/customami-Linux-2
    'ami-01c29a09a40085d61',    #/nimbus/gold/linux/amazon
    'ami-0fe51c6da754c5e1e43',  #/ihdpops/emr/customami old
    'ami-08944f421b0d53a4c'     #/ihdpops/emr/customami_emr6
  )

SELECT
  resourceId
WHERE
  resourceType = 'AWS::EC2::Instance'
  AND tags.tag = 'CREATOR_ID=tsouayah'
  AND tags.tag = 'APP_ID=1914'
  AND configuration.imageId NOT IN (
    'ami-0fe51c6da754c5e1e',
    'ami-0e502360aaf34b8ed',
    'ami-01c29a09a40085d61',
    'ami-0fe51c6da754c5e1e43',
    'ami-08944f421b0d53a4c'
  )

SELECT
  resourceId
WHERE
  resourceType = 'AWS::EC2::Instance'
  AND tags.tag = 'CREATOR_ID=pbelurbalaji'
  AND tags.tag = 'APP_ID=1914'
  AND configuration.imageId NOT IN (
    'ami-0fe51c6da754c5e1e',
    'ami-0e502360aaf34b8ed',
    'ami-01c29a09a40085d61',
    'ami-0fe51c6da754c5e1e43',
    'ami-08944f421b0d53a4c'
  )