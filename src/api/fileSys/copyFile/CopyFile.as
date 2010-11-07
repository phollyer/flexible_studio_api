package api.fileSys.copyFile
{
	import flash.events.IEventDispatcher;
	import api.fileSys.FileSys;
	
	[Event(name="missingFromPath" , type="api.events.SWFStudioEvent")]
	[Event(name="missingToPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class CopyFile extends FileSys
	{
		// Optional
		public var failIfExists:Boolean = false;
		
		// Required
		public var fromPath:String = null;
		public var toPath:String = null;
		
		public function CopyFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function copyFile( fromSTR:String = null , toSTR:String = null ):void
		{
			fromPath = compareStrings( fromSTR , fromPath );
			toPath = compareStrings( toSTR , toPath );
			
			switch( fromPath )
			{
				case null:
					missingFromPath();
					break;
				default:
					switch( toPath )
					{
						case null:
							missingToPath();
							break;
						default:
							copy();
					}
			}
		}
		private function copy():void
		{
			ssCore.FileSys.copyFile( {from:fromPath , to:toPath , failIfExists:failIfExists}
									,{callback:actionComplete, errorSTR:"copyFileError", code:"9018"} );
		}

	}
}