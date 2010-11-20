package api.wmVideo.play
{
	import api.events.wmVideo.play.PlayEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_play.html Northcode Help Documentation
	*/
	public class Play extends WmVideo
	{
		/**
		* Constructor for WmVideo.Play()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_play.html Northcode Help Documentation
		*/
		public function Play(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_play.html Northcode Help Documentation
		*/
		public function play():void
		{
			ssCore.WmVideo.play( {}
								,{callback:actionComplete, errorSTR:"playError", code:"46003"} );
		}
	}
}