package api.wmVideo.setPosition
{
	import flash.events.IEventDispatcher;
	import api.wmVideo.WmVideo;
	
	[Bindable]
	public class SetPosition extends WmVideo
	{
		// Optional 
		public var x:Number = 0;
		public var y:Number = 0;
		
		public function SetPosition(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setPosition():void
		{
			ssCore.WmVideo.setPosition( {x:x , y:y}
									   ,{callback:actionComplete, errorSTR:"setPositionError", code:"46011"} );
		}
	}
}