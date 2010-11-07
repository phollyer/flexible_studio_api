package api.wmVideo.setFlags
{
	import flash.events.IEventDispatcher;
	import api.wmVideo.WmVideo;
	
	[Bindable]
	public class SetFlags extends WmVideo
	{
		// Optional 
		public var lockPosition:Boolean = true;
		public var lockSize:Boolean = true;
		
		public function SetFlags(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setFlags():void
		{
			ssCore.WmVideo.setFlags( {lockPosition:lockPosition , lockSize:lockSize}
									,{callback:actionComplete, errorSTR:"setFlagsError", code:"46005"} );
		}
	}
}