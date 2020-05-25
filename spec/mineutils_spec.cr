require "./spec_helper"

describe MineUtils do
  it "works" do
    MineUtils::VERSION.should eq("0.1.0")
  end

  it "generates UUID" do
    string = "wtf am i doing"
    MineUtils::UUID.generate(string).should match(/[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}/)
  end

  it "parses join request" do
    jr = MineUtils::JoinRequest.from_json %({"serverId":"foo", "accessToken":"bar", "selectedProfile":"uuid"})
    jr.serverId.should eq("foo")
    jr.accessToken.should eq("bar")
    jr.selectedProfile.should eq("uuid")
  end
end
