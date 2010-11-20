package api.fileSys.clearAttrs
{
	import flash.events.IEventDispatcher;
	import api.fileSys.FileSys;

	[Event(name="missingAttrs" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ClearAttrs extends FileSys
	{
		// Required
		public var attributes:String = null;
		public var path:String = null;
		
		public function ClearAttrs(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function clearAttrs( filePath:String = null , fileAttrs:String = null ):void
		{
			path = compareStrings( filePath , path );
			attributes = compareStrings( fileAttrs , attributes );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					switch( attributes )
					{
						case null:
							missingAttrs();
							break;
						default:
							clear();
					}
			}
		}
		private function clear():void
		{
			ssCore.FileSys.clearAttrs( {attributes:attributes , path:path}
									  ,{callback:actionComplete, errorSTR:"clearAttrsError", code:"9017"} );
		}

	}
}