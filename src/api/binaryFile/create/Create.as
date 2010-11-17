package api.binaryFile.create
{
	import flash.events.IEventDispatcher;
	
	import api.binaryFile.BinaryFile;
	import api.vos.binaryFile.AccessModeVO;
	import api.vos.binaryFile.ShareModeVO;
	
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Create extends BinaryFile
	{		
		// Required
		public var path:String = null;
		
		// Optional
		public var accessMode:String = AccessModeVO.READ;
		public var shareMode:String = ShareModeVO.NONE;
		public var failIfExists:Boolean = false;
		
		// Result
		public var systemError:String = null;
		
		public function Create(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function create( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.BinaryFile.create( {path:path
											  ,accessMode:accessMode
											  ,shareMode:shareMode
											  ,failIfExists:failIfExists} , {callback:actionComplete, errorSTR:"createError", code:"11002"} );
			}
		}
	}
}