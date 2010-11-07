package api.sysTools.getImageInfo
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysTools.getImageInfo.GetImageInfoEvent;
	import api.sysTools.SysTools;
	
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.sysTools.getImageInfo.GetImageInfoEvent")]
	[Bindable]
	public class GetImageInfo extends SysTools
	{
		// Required
		public var path:String = null;
		
		// Result
		public var height:Number = 0;
		public var width:Number = 0;
		
		public function GetImageInfo(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getImageInfo( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.SysTools.getImageInfo( {path:path}
												 ,{callback:actionComplete, errorSTR:"getImageInfoError", code:"39002"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			height = Number( r.height );
			width = Number( r.width );
			
			var e : GetImageInfoEvent = new GetImageInfoEvent( GetImageInfoEvent.RESULT );
			e.height = height;
			e.width = width;
			dispatchEvent( e );
		}
	}
}