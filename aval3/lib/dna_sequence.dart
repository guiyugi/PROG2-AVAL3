import 'dart:math';

class DNASequence {
  final int length;
  final String dnaSequence;
  static List<String> nucleotideList = ['A', 'C', 'T', 'G'];

  DNASequence._load({required this.length, required this.dnaSequence}) {
    if (length <= 0) {
      throw Exception('Invalid size of lenght: $length');
    }
  }

  factory DNASequence(int lenght) {
    final bases = ['A', 'T', 'C', 'G'];
    final random = Random();
    final List<String> sequenceList =
        List.generate(lenght, (index) => bases[random.nextInt(bases.length)]);
    final randomSequence = sequenceList.join('');
    if (!_isValidSequence(randomSequence)) {
      throw Exception('Invalid sequence: $randomSequence');
    }
    return DNASequence._load(length: lenght, dnaSequence: randomSequence);
  }
  @override
  String toString() {
    return '[$dnaSequence]';
  }

  int countNucleotides(String nucleotide) {
    if (!nucleotideList.contains(nucleotide)) {
      throw Exception('Invalid nucleotide: $nucleotide');
    }
    return dnaSequence.split(nucleotide).length - 1;
  }

  static bool _isValidSequence(String sequence) {
    return sequence
        .split('')
        .every((nucleotide) => nucleotideList.contains(nucleotide));
  }

  DNASequence reversedDNA() {
    final reversedSequence = dnaSequence.split('').reversed.join();
    return DNASequence._load(length: length, dnaSequence: reversedSequence);
  }

  DNASequence complementedDNA() {
    final complements = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'};
    final complementedDNA = dnaSequence
        .split('')
        .map((nucleotide) => complements[nucleotide])
        .join('');
    return DNASequence._load(length: length, dnaSequence: complementedDNA);
  }
}
