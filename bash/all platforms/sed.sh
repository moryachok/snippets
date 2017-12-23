#!/usr/bin/env bash

# https://habrahabr.ru/company/ruvds/blog/327530/
# THIS SCRIPT WILL CONTAIN SOME EXAMPLES OF USING SED FUNCTION IN BASH

#  s - substitute - замена
#  i - insert text before the actual text
#  a - insert text after actual text
# -e - executing multiple commands in singl call
# -f - executing commands from file


###### COMBINATIONS
# commands: s,i,a,d,r
# arguments: -e, -n
# flags: g, 2, 3
# helpers: 2s; 2,5s; 2,$s
echo "Some text" | sed '{command}/{pattern}/{replacement}/'
echo "Some text" | sed {argument} '{command}/{pattern}/{replacement}/'
echo "Some text" | sed '{command}/{pattern}/{replacement}/{flag}'
echo "Some text" | sed '{helpers}{command}/{pattern}/{replacement}/'



echo "This is a test" | sed "s/test/Misha/" # "This is a Misha"

sed 's/test/another test/' ./myfile.txt # will only print out the changed text without modifying the file


####### Multiple substitutions in same command
sed -e 's/Some/Any/; s/test/other test/' ./myfile.txt # execute multiple substitutions in a single command

sed -e '
>  s/Some/Any/;
>  s/test/other test/' ./myfile.txt # same command for multiple lines approach


####### Executing sed commands from file
sed -f commands.txt source.txt



####### FLAGS

echo "This is a test, and this is test too" | sed "s/test/bla/"  # no flags | This is a bla, and this is test too
echo "This is a test, and this is test too" | sed "s/test/bla/g" # "g" flag  | This is a bla, and this is bla too
echo "This is a test, and this is test too" | sed "s/test/bla/2" # will change second appearance | This is a test, and this is bla too
sed -n 's/test/another test/p' myfile                            # "p" flag | will print changed line | This is a another test.
sed 's/test/another test/w output' myfile                        # "w" flag | will save changed line to a file


###### DELIMITERS
sed 's/\/bin\/bash/\/bin\/csh/' /etc/passwd  # hard to read
sed 's!/bin/bash!/bin/csh!' /etc/passwd # first char after "s" command will be assigned as delimiter


###### CHOOSING TEXT FRAGMENTS
sed '2s/test/another test/' myfile #change second line only
sed '2,3s/test/another test/' myfile # change second and third lines
sed '2,$s/test/another test/' myfile # change from second line till the end of text

###### USING FILTERS
echo 'misha the greatest man' | sed '/grisha/s/greatest/poor/' # Nothing will be changed
echo 'grisha the greatest man' | sed '/grisha/s/greatest/poor/' # grisha the poor man
echo 'vasya and grisha are greatest men' | sed '/grisha/s/greatest/poor/' #vasya and grisha are poor men


###### DELETE COMMAND
sed '3d' multiline.txt # will print out file without 3rd line, not affects the source file
sed '2,3d' multiline.txt # delete 3rd and 4th lines
sed '2,$d' multiline.txt # delete from 2 till the end of text
sed '/COMPRESSION/d' multiline.txt # delete line with matching pattern
sed '/COMPRESSION/,/Well/d' multiline.txt # delete lines with multiple patterns

###### i - before, a - after, c - instead

echo 'The first line' | sed 'i\Actual first line' # will insert text before defined text
# >> Actual first line
# >> The first line

echo 'The first line' | sed 'a\This is a second line' # will insert text before defined text
# >> The first line
# >> This is a second line

sed '2i\This is the inserted line.' myfile # will insert text before second line
sed '2a\This is the inserted line.' myfile # will insert text after second line
sed '3c\This is a modified line.' multiline.txt # Replace line 3 with text, no affect on source file
sed '/HST/c LINE CHANGED' multiline.txt # replace all the line where matched word exists

###### REPLACING CHARS, DIGITS etc...

echo '0544330644' | sed 'y/44/99/' #0599330699
echo '0544330644' | sed 'y/44/99/2' # ERROR, always executes globally


###### OTHER USEFUL COMMANDS

sed '=' multiline.txt # print each line with its line number
# >> 1
# >> The first line content
# >> 2
# >> The second Line content
# >> 3
# >> The third line content

sed '/second/=' multiline.txt
# >> The first line content
# >> 2
# >> The second Line content
# >> The third line content

sed '2r myfile.txt' multiline.txt # append content from myfile.txt file to multiline.txt after 2nd line
# >> The first line content
# >> The second Line content
# >> This is content from myfile.txt
# >> The third line content

sed '/first/r myfile.txt' multiline.txt # append content from myfile.txt file to multiline.txt after pattern matched line
# >> The first line content
# >> This is content from myfile.txt
# >> The second Line content
# >> The third line content

sed '/content/r myfile.txt' multiline.txt # append content from myfile.txt file to multiline.txt after each pattern matched
# >> The first line content
# >> This is content from myfile.txt
# >> The second Line content
# >> This is content from myfile.txt
# >> The third line content
# >> This is content from myfile.txt

