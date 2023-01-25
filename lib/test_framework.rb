module TestFramework
  VERSION = '6.1.0'

  class TestFrameworkCore
    def beforeEach
      yield
    end

    def afterEach
      yield
    end

    def beforeAll
      yield
    end

    def afterAll
      yield
    end
  end
end
