# Paiku??? (play on prolog and haiku lol idk)

Using the robust pattern-matching and unification strengths of Prolog, our project will generate English haikus that will hopefully make semantic and grammatical sense.

This project is in fulfillment of the [CPSC 312 2021W1 project requirements](https://steven-wolfman.github.io/cpsc-312-website/project.html).

## Team Members

Our team is:

+ Eric Kuo 58163288
+ Duy Nguyen 95844189

## Product Pitch
A Prolog Haiku:
     >>Unification—
      >>and backtracking predicates.
      >>Throughout the seasons.

Originating from Japan, a Haiku is a short form of poetry consisting of three phrases or lines, with five syllables in the first line, seven in the second, and five in the third. Traditionally, Haikus carry a theme centered around nature and seasons, however, modern iterations can be about anything. 

Our program, Paiku, will have the ability to generate (and maybe read aloud!) semantically correct haikus that are tailored towards the user. This means that Paiku will have some form of user input, such as words and themes, and use this to generate an appropriate haiku.  

One of Prolog’s biggest features is unification. As English grammar can be broken down into disparate components: nouns, verbs, adjectives, modifiers, determiners, and particles, unification allows us to carefully order and reconstruct these small units into a structured form that is a haiku. Although this is obviously rudimentary and will not create haikus that have as much nuance as those written by poets, our project will create an opportunity for us to be exposed to:
- How computers can process and represent languages
- How the logic programming paradigm, compared to others, will help us create a semantic model for language
- How can we use our broken down semantic model to expand our program and generate different forms of poetry
- What APIs and libraries can we use to accurately simulate poetic devices such as rhymes
- How we can potentially implement artificial intelligence to generate syntactically improved haikus

Through this project, we will be able to explore these concepts whilst applying current and newly learned Prolog ideas.

## Minimal Viable Project
In our Proof of Concept, we employed various new language elements in order to explore the robustness and unique strengths of Prolog. We separated our codebase into two modules to clearly define which part is parsing data from our API and which part is actually generating the Haiku. Prolog also provides in-depth support for HTTP operations which we used to fetch words from an online source  (datamuse API), which is then converted into a format readable by Prolog using JSON. In addition we also used the library(readutil)) to manage IO operations. 

With the basic functionality for Paiku down, we plan on adding the following features:
- Correct grammatical structure to our haiku using the tags that go with each word’s metadata. 
    * Our current POC has a very limited and arbitrary semantic structure regardless of each word having a Parts of Speech (PoS) identifier. As such, we plan on using these identifiers to ‘place’ words into their syntactically correct positions. 
- Better API calls and parsing
    * Our current POC has a bug in that sometimes our API call doesn’t return any words that match the criteria and so when the haiku is generated, there are filler “N/A” words. We will look to improve this feature by studying more carefully what is the reason behind this bug and how we can use the API better.
- Identify Parts of Speech that are currently labelled with a ‘u’ tag. 
    * Some entries on the Datamuse API aren’t categorised into any PoS, even though in regular English they can be categorised into several subcategories: prepositions, determiners, particles, modifiers. In our MVP, we will incorporate these subcategories by creating our own predicates that sort and identify words labelled with a ‘u’ tag.
- Potentially look at using Definite Clause Grammars (DCGs) to represent grammatical relationships
    * DCGs are a Prolog tool that can be used to parse and tag text. As generating a haiku is an extremely constrained task, we could use existing methods to restrain the structure of our words. However, as we are primarily concerned with generating Haikus, we can ignore other possible English nuances. Thus, we could just hard code the grammatical structure as  it might be cumbersome to include an extra step.
- Flashy Features - two features that we think could be fun as well as education to explore:
    * Artificial Intelligence - some way to increase the accuracy of our Haiku by providing more powerful natural language processing methods that involve AI. This way, we could potentially introduce more complex language and poetic devices such as tonality, word sounds (i.e. plosives, sibilance, etc.), and word connotations.
    * Text to Speech - a neat fun feature that we could implement to make Paiku more interactive. Generated Haikus could be read aloud via a library that converts text to audio files that can be played (or some similar mechanism). 


Glossary:
- preposition: a word or group of words used before a Noun to show the Noun’s direction, time, place, location, spatial relationships, or to introduce an object. 
- determiner: a word used before a Noun to identify the Noun in further detail. 
- particle: a word that has a grammatical function but does not fit into the main parts of speech.
- modifier: adds information to another element in the sentence and is a word, adjective, an adverb, or a phrase or clause.  



## Proof of Concept

Replace this with a description of your proof-of-concept. This may be as short as a few paragraphs, or it may be longer.
It should **definitely** take less than 4 minutes to read carefully and thoroughly, though working through and running the
code may take an extra 4 minutes. (Your guidance and links should make it easy for us to work through the code.)

Tell us:

+ what key element of your project the proof-of-concept focuses on
+ what makes that such an important element
+ how completing this gives you confidence that, with sufficient work, you could complete the full (minimal viable) project

Include links (likely even line-level links, which are easy to create in Github) throughout to critical pieces of
the code to make it easy for us to understand what you've accomplished and how it fulfills the requirements.

Also include instructions for us to test and run your code. (See our guidelines below.)

A good goal to aim for is the top rubric item from proposal grading:

> Fully functional proof-of-concept is easy to use and review, and it clearly demonstrates a key element necessary for the overall project.

### How to test and run the code: Prolog

Replace this section with instructions to us for how to test and run your code.

We have set up a simple test file for you to extend using [Prolog Unit Testing](https://www.swi-prolog.org/pldoc/doc_for?object=section(%27packages/plunit.html%27)) library for testing. Included among your tests should be some that demonstrate the core functionality of your code. Please remove the example tests before you submit or you will lose marks. (We will be running `make prolog-eval` from the project root.)

In the `prolog` directory, you can run `make test` to run the unit tests. You can also load the test file into the swipl repl with `make test-repl` and in that repl you can run `run_tests.` to run those tests.

If you include instructions different from these, be **absolutely sure** that they will work well for us in whatever environment we run your code and that they will be as easy to use as the instructions above!
