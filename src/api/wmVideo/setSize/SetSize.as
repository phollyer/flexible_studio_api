package api.wmVideo.setSize
{
	import flash.events.IEventDispatcher;
	import api.wmVideo.WmVideo;
	
	[Bindable]
	public class SetSize extends WmVideo
	{
		// Optional 
		public var height:Number = 240
		public var width:Number = 320;
		
		public function SetSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setSize():void
		{
			ssCore.WmVideo.setSize( {height:height , width:width}
								   ,{callback:actionComplete, errorSTR:"setSizeError", code:"46014"} );
		}
	}
}