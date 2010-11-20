package api.flash.getStageSize
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.flash.getStageSize.GetStageSizeEvent;
	import api.flash.Flash;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.flash.getStageSize.GetStageSizeEvent")]
	[Bindable]
	public class GetStageSize extends Flash
	{
		// Required
		public var path:String = null;
		
		// Result
		public var height:Number = 0;
		public var width:Number = 0;	
		
		public function GetStageSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getStageSize( swfPath:String = null ):void
		{
			path = compareStrings( swfPath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Flash.getStageSize( {path:path}
											  ,{callback:actionComplete, errorSTR:"getStageSizeError", code:"21004"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			height = Number( r.height );
			width = Number( r.width );
			
			var e : GetStageSizeEvent = new GetStageSizeEvent( GetStageSizeEvent.RESULT );
			e.height = height;
			e.width = width;
			dispatchEvent( e );
		}
	}
}