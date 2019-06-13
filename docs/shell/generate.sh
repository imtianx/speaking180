#! /bin/bash

templeteFileName="note.md.template"
sidebarFineName="_sidebar.md"

no="NO"
titleEn="TITLE_EN"
titleZh="TITLE_EN"

temp=""
formateNo=""

for i in {1..180}
do
  if [ ${i} -lt 10 ];
  then
    formateNo="00${i}"
  elif [ ${i} -lt 100 ];
  then
    formateNo="0${i}"
  else
    formateNo="${i}"
  fi
  temp="${formateNo}.md"
  cp ${templeteFileName} ${temp};
  sed -i "" "s/${no}/${formateNo}/g" ${temp};
  echo "  * [${formateNo}.](note/${formateNo}.md)" >> ${sidebarFineName};
done

