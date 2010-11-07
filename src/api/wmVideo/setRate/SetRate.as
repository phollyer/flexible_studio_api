package api.wmVideo.setRate
{
	import flash.events.IEventDispatcher;
	import api.wmVideo.WmVideo;
	
	[Bindable]
	public class SetRate extends WmVideo
	{
		// Optional 
		public var rate:Number = 1;
		
		public function SetRate(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setRate():void
		{
			ssCore.WmVideo.setRate( {rate:rate}
								   ,{callback:actionComplete, errorSTR:"setRateError", code:"46012"} );
		}
	}
}