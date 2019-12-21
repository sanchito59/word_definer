# The Word Definer

## By **Chris Sanchez**

The [Word Definer](https://warm-brushlands-74758.herokuapp.com/) is a CRUD (Create, Read, Update, Delete) application to supplement literacy education by allowing users to add words that they may not know the definition of to a catalogue. Users can update the word's definition or add multiple definitions to words within the catalogue.
- - - -
### Setup/Installation Requirements

![enter image description here](https://i.imgur.com/UStodOA.jpg "read")

#### Zip:

1. Click [here](https://github.com/sanchito59/word_definer.git) to go to the repository location where you will find the clone/download menu.

 2. Navigate to the directory (folder) that contains your browser's downloads.
 3. Double-click on **The Word Definer** directory (folder).
 4. Open directory contents by extracting/unzipping documents from folder.
 5. In the terminal/command line, and with NPM and Ruby 2.5.1 installed, and within the folder, run `bundle install`.
 6. Finally, run `ruby script.rb` to use **The Word Definer**.

#### Clone: 

 1. To clone the repository, from your terminal or command line enter: "git clone  https://github.com/sanchito59/word_definer.git"
 2. Once the repository finishes downloading you will need to navigate to it in the terminal/command line.
 5. With NPM and Ruby 2.5.1 installed, and within the folder, run `bundle install`.
 6. Finally, run `ruby script.rb` to use **The Word Definer**.

- - - -

### Specifications:

|Behavior|Input|Output|
|---|---|---|
|(Read/GET)|User is on the homepage. |Homepage displays a list of all the words, or if there aren't any: 'You haven't added any words yet. Click below to get started!'|
|(Create/POST) User adds a word to the catalogue of words. |'languid'|'displaying or having a disinclination for physical exertion or effort; slow and relaxed.'|
|(Update/PATCH) User changes or adds definitions to a word. |'weak or faint from illness or fatigue.'|1. 'displaying or having a disinclination for physical exertion or effort; slow and relaxed.' 2. 'weak or faint from illness or fatigue.'|
|(Delete/DELETE)|The user deletes a definition they no longer want. |'weak or faint from illness or fatigue.'|
|(Delete/DELETE)|The user deletes a word they no longer want. |'languid'|'You haven't added any words yet. Click below to get started!'|
- - - -

### Technologies Used

 - Ruby
 - Sinatra
 - Test Driven Development

- - - -
### Support and Contact

If you run into any issues running **The Word Definer**, please contact **Chris Sanchez**.

### License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Copyright (c) 2019 **Chris Sanchez**