# calc_search

A searchable formula library for the TI-Nspire line of calculators

## Description 

The goal of this project is to make an easily searchable formula library so that on exams or when you don't have easy access to everyone's favorite search engine (google) you are able to easily search and find what you need to solve the problem. 

## Installation

You are able to install calc_search on the TI-Nspire line of calculators using a variety of programs to transfer the program. My favorite is the open source [N-Link][n-link] but there are other options from Texas Instruments such as the student software which will do the same thing. 

## Usage

Once you have the calc_search file on your calculator simply open the file, enter your query, then press enter to get your results.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :)

##### Some notes that may help you in you quest to contribute

* There is a comp_search file which is a version of calc search designed to be run on a computer which can be used to test code without having to transfer the code to a calculator every time you want to test it. To use the comp_search file just run it like you would any other lua script. 

* To convert the calc_search lua file to a tns file so that it can be run on a calculator I use [Luna][luna].

* The TI-Nspire has its own scripting API which the reference for can be found [here][ti-nspire_reference].

## TODOs

* Expand the amount of formula definitions. (Eventually we may include other searchable definitions such as physics concepts so submit pull requests for other content areas as well)
* Improve the search algorithm. 
* Make interface more user friendly. 

## Version History

TODO: Write history

## License

TODO: Write license


[n-link]: https://lights0123.com/n-link/
[luna]: https://github.com/ndless-nspire/Luna
[ti-nspire_reference]: https://education.ti.com/en/guidebook/details/en/59108CCE54484B76AF68879C217D47B2/ti-nspire_scripting-api-guide
