package novelspec;
import novel.Novel;

class NovelSpec extends haxespec.FuryTestCase {
	private var novel : Novel;
	public override function setup() { 
		this.novel = new Novel();
	} // Setup
	public override function tearDown(){ } // tearDown
	public function testNovel() { 
	
	} // testNovel
} // NovelSpec