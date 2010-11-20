package api.fileSys.setAttrs
{
	import flash.events.IEventDispatcher;
	import api.fileSys.FileSys;

	[Event(name="missingAttrs" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetAttrs extends FileSys
	{
		// Required
		public var attrs:String = null;
		public var path:String = null;
		
		public function SetAttrs(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setAttrs( fileOrFolderPath:String = null , attrsSTR:String = null ):void
		{
			path = compareStrings( fileOrFolderPath , path );
			attrs = compareStrings( attrsSTR , attrs );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					switch( attrs )
					{
						case null:
							missingAttrs();
							break;
						default:
							setAttributes();
					}
			}
		}
		private function setAttributes():void
		{
			ssCore.FileSys.setAttrs( {path:path , attrs:attrs}
									,{callback:actionComplete, errorSTR:"setAttrsError", code:"9034"} );
		}

	}
}