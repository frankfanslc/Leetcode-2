require 'pry'
require 'rspec'

def num_of_gene_occurrences(dna, gene)
  # handle argument errors
  # Assume length of DNA sequence
  #
  # 1. Get length of gene sequence
  # 2. Partition dna sequence using length
  # 3. Iterate over partitions and match gene sequence
  # 4. Increment counter
  #
  # 1. Increment through dna
  # 2. Look for first letter of gene match
  # 3. See if next letters match gene
  #   3a. if yes, remove from sequence + repeat
  #   3b. if no, continue with next letter
  #

  idx = 0
  count = 0
  gene_first_letter = gene.chars.first
  reached_end = true
  original_length = dna.chars.length
  dna_seq_array = dna.chars

  while reached_end do
    if dna_seq_array[idx] == gene_first_letter
      end_range = idx + (gene.length - 1)
      next_chars = dna_seq_array[idx..end_range]

      if gene == next_chars.join("")
        dna_seq_array.slice!(idx..end_range)
        count += 1
        idx = 0
      else
        idx += 1
      end
    else
      idx += 1
    end

    if original_length == idx
      reached_end = false
    end
  end

  count
end

RSpec.describe "Gene Sequencing" do
  it "Outputs the amount of times a gene occurs" do
    dna = "CATGCATGCATG"
    gene = "TGC"
    result = 2

    expect(
      num_of_gene_occurrences(dna, gene)
    ).to eq result
  end

  it "Outputs the amount of times a gene occurs" do
    dna = "GTTTTAGAAAAG"
    gene = "TT"
    result = 2

    expect(
      num_of_gene_occurrences(dna, gene)
    ).to eq result
  end

  it "Outputs the amount of times a gene occurs" do
    dna = "GTAGAATCATGCA"
    gene = "GTGTGT"
    result = 0

    expect(
      num_of_gene_occurrences(dna, gene)
    ).to eq result
  end
end
