package api.wmAudio.setRate
{
	import flash.events.IEventDispatcher;
	import api.wmAudio.WmAudio;
	
	[Bindable]
	public class SetRate extends WmAudio
	{
		// Optional 
		public var rate:Number = 1;
		
		public function SetRate(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setRate():void
		{
			ssCore.WmAudio.setRate( {rate:rate}
								   ,{callback:actionComplete, errorSTR:"setRateError", code:"46007"} );
		}
	}
}