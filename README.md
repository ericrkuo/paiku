# Paiku??? (play on prolog and haiku lol idk)

Using the robust pattern-matching and unification strengths of Prolog, our project will generate English haikus that will hopefully make semantic and grammatical sense.

## Demo
Try counting the syllables, it should follow the 5-7-5 structure!
<p align="center">
    <img src="https://user-images.githubusercontent.com/49849754/146521735-0f99dac6-5b08-40ff-96b7-5464fb9f3643.gif" width="500"/>
</p>

## Running the code

- `cd` into the `prolog` directory
- run `swipl src.pl`
- enter the query `?- start.`
> Note there is no need for an API key because the Datamuse API is free.
- Remarks:
    - the query `?- start.` will prompt you to enter a 1-5 topics you want for your haiku. Please enter them in comma separated values. Some topics to try can be (without the quotation marks):
        - "soccer,basketball"
        - "autumn,leaves,orange"
        - anything you're curious about!
    - Notice how each line in our haiku adheres to the 5-7-5 syllable structure.
- Some interesting cases to try
    - You can press `;` to see different variations of the haiku generated
    - load `swipl api.pl` and try the query `?- get_words(‘topic1,topic2’, Words).` Replace the first term with a comma separated list of topics you’re interested in. This will call the API and give a list of compound terms, `word(Value, NumSyllables, PoS)`.

## Testing the code
From the `prolog` directory, run `swipl -g run_tests -t halt test.pl`

Some of our main test groups testing core logic of our proof of concept
- [convert_to_words/2 tests](https://github.students.cs.ubc.ca/ngduy28/cpsc-312-project-prolog/blob/e3d3a2959ad35c821d0deaf29684ebbb2209a826/prolog/test.pl#L17)
- [random_word_syllable/4 tests](https://github.students.cs.ubc.ca/ngduy28/cpsc-312-project-prolog/blob/e3d3a2959ad35c821d0deaf29684ebbb2209a826/prolog/test.pl#L42)
- [pick_random_word/3 tests](https://github.students.cs.ubc.ca/ngduy28/cpsc-312-project-prolog/blob/e3d3a2959ad35c821d0deaf29684ebbb2209a826/prolog/test.pl#L112)
- [same_syllable/2, same_parts_of_speech/2, get_value/2 tests](https://github.students.cs.ubc.ca/ngduy28/cpsc-312-project-prolog/blob/e3d3a2959ad35c821d0deaf29684ebbb2209a826/prolog/test.pl#L136) 
