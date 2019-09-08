import unittest
import fastq_reader


class TestFastqReader(unittest.TestCase):

    def test_it_exists(self):
        fastq_reader = FastqReader()
        self.assertIsInstance(fastq_reader, FastqReader())


if __name__ == '__main__':
    unittest.main()
