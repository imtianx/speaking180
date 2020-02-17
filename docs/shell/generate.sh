#! /bin/bash

# config file
templeteFileName="note.md.template"
sidebarFineName="_sidebar.md"
configFile="config_115_180.json"

# templete params
templete_no="NO"
templete_title_en="TITLE_EN"
templete_title_zh="TITLE_ZH"


# init sidebar file
# echo "* **目录**" > ${sidebarFineName};

newFile=""

# json config data ,using jq tools 
data=`cat ${configFile} | jq '.' `

length=`cat ${configFile} | jq 'length' `

for index in `seq 1 ${length}`
do 

  # get fields
  no=`echo $data | jq -r ".[$index-1].no" `
  title_en=`echo $data | jq -r ".[$index-1].title_en" `
  title_zh=`echo $data | jq -r ".[$index-1].title_zh" `

  # copy file 
  newFile="${no}.md"
  cp ${templeteFileName} ${newFile};

  # modify templete
  sed -i "" "s/${templete_no}/${no}/g;s/${templete_title_en}/${title_en}/g;s/${templete_title_zh}/${title_zh}/g" ${newFile};

  # add file to sidebar
  echo "  * [${no}. ${title_zh}](note/${no}.md)" >> ${sidebarFineName};

  echo " >> ：${no} file generated!"
  
done

echo " >> : ---------------------all generated task exectue success !"


