package api.flash.getFrameCount
{	
	import flash.events.IEventDispatcher;
	
	
	import api.events.flash.getFrameCount.GetFrameCountEvent;
	import api.flash.Flash;

	[Event(name="result", type="api.events.flash.getFrameCount.GetFrameCountEvent")]
	[Bindable]
	public class GetFrameCount extends Flash
	{
		// Optional
		public var path:String = null;
		
		// Result
		public var totalFrames:Number = 0;		
		
		public function GetFrameCount(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getFrameCount():void
		{
			switch( path )
			{
				case null:
					ssCore.Flash.getFrameCount( {}
											   ,{callback:actionComplete, errorSTR:"getFrameCountError", code:"21002"} );
					break;
				default:
					ssCore.Flash.getFrameCount( {path:path}
											   ,{callback:actionComplete, errorSTR:"getFrameCountError", code:"21002"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			totalFrames = Number( r.result );
			
			var e : GetFrameCountEvent = new GetFrameCountEvent( GetFrameCountEvent.RESULT );
			e.totalFrames = totalFrames
			dispatchEvent( e );
		}
	}
}