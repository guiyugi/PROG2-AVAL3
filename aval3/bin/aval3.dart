import 'package:aval3/dna_sequence.dart';

void main() {
  var dna = DNASequence(3);
  print(dna);
  dna.reversedDNA();
  print(dna.reversedDNA());
  print(dna.complementedDNA());
  print(dna.countNucleotides('C'));
  print(dna.countNucleotides('j'));
}
