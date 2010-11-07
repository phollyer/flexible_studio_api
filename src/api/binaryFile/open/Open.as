package api.binaryFile.open
{
	import flash.events.IEventDispatcher;
	
	import api.binaryFile.BinaryFile;
	import api.vos.binaryFile.AccessModeVO;
	import api.vos.binaryFile.ShareModeVO;
	
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Open extends BinaryFile
	{
		// Required
		public var path:String = null;
		
		// Optional
		public var accessMode:String = AccessModeVO.READ;
		public var shareMode:String = ShareModeVO.NONE;
		
		// Results
		public var systemError:String = null;
		
		public function Open(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function open( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.BinaryFile.open( {path:path
											,accessMode:accessMode
											,shareMode:shareMode} , {callback:actionComplete, errorSTR:"openError", code:"11007"} );
			}
		}
	}
}