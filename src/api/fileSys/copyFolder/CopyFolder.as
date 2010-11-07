package api.fileSys.copyFolder
{
	import flash.events.IEventDispatcher;
	import api.fileSys.FileSys;	
	
    [Bindable]
	public class CopyFolder extends FileSys
	{
		// Required		
		public var fromPath:String = "";
		public var toPath:String = "";
		
		// Optional
		public var failIfExists:Boolean = false;
		
		public function CopyFolder(target:IEventDispatcher=null)
		{
			super(target);
		}
				
		public function copyFolder( fromSTR:String = null , toSTR:String = null ):void
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
			ssCore.FileSys.copyFolder( {from:fromPath , to:toPath}
									  ,{callback:actionComplete, errorSTR:"copyFolderError", code:"9003"} );
		}

	}
}