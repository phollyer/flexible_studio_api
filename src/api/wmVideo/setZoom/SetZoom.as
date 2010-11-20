package api.wmVideo.setZoom
{
	import flash.events.IEventDispatcher;
	import api.wmVideo.WmVideo;
	
	[Bindable]
	public class SetZoom extends WmVideo
	{
		// Optional 
		public var zoom:Number = 100;
		
		public function SetZoom(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setZoom():void
		{
			ssCore.WmVideo.setZoom( {zoom:zoom}
								   ,{callback:actionComplete, errorSTR:"setZoomError", code:"46017"} );
		}
	}
}