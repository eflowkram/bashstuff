#!/bin/bash

HEADER=$(cat<<EOF
<Addressbook>
    <pbgroup>
        <id>1</id>
        <name>Phonebook1</name>
        <ringtones/>
    </pbgroup>
EOF
)

echo $HEADER
contact() {
cat << EOF
<Contact>
    <FirstName>$FNAME</FirstName>
    <LastName>$LNAME</LastName>
    <Phone type="Mobile">
    <phonenumber>$NUMBER</phonenumber>
    <accountindex>1</accountindex>
    </Phone>
</Contact>
EOF
}

IFS=$'\n'
for L in `cat $1`; do
LNAME=$(echo $L | cut -f4 -d',')
FNAME=$(echo $L | cut -f2 -d',')
PTYPE=$(echo $L | cut -f32 -d',')
NUMBER=$(echo $L | cut -f33 -d',')
contact
done
echo "</Addressbook>"
