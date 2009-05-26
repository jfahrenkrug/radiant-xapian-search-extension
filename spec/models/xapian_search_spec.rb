require File.dirname(__FILE__) + '/../spec_helper'

describe XapianSearchExtension do
  it "should add Search toggle to admin UI" do
    admin = Radiant::AdminUI.instance
    admin.page.edit.extended_metadata.should include("search_toggle")
  end
end