require "digest/md5"

module MineUtils
  module UUID
    def self.generate(username : String) : String
      digest = Digest::MD5.digest("OfflinePlayer:#{username}")

      io = IO::Memory.new(32)
      io << digest
      io.rewind

      t_lo = io.read_bytes(UInt32, IO::ByteFormat::BigEndian)
      t_mi = io.read_bytes(UInt16, IO::ByteFormat::BigEndian)
      t_hi = io.read_bytes(UInt16, IO::ByteFormat::BigEndian)
      cs_hi = (io.read_bytes(UInt8) & 0x3F) | (1 << 7)
      cs_lo = io.read_bytes(UInt8)

      rest = Bytes.new(6)
      io.read rest

      t_hi &= 0x0FFF
      t_hi |= 3 << 12

      sprintf(
        "%08x-%04x-%04x-%02x%02x-%02x%02x%02x%02x%02x%02x",
        t_lo, t_mi, t_hi, cs_hi, cs_lo, rest[0], rest[1], rest[2], rest[3], rest[4], rest[5]
      )
    end
  end
end
