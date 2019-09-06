import unittest
import fastq_reader


class TestFastqReader(unittest.TestCase):

    def test_it_exists(self):
        # fastq_reader = FastqReader.new
        assertIsInstance(self, FastqReader)
