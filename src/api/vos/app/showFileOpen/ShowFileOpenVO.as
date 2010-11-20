package swfStudio.vos.app.showFileOpen
{
	import swfStudio.vos.app.style.DialogListViewStyleVO;
	import swfStudio.vos.globals.Globals;
	[Bindable]
	public class ShowFileOpenVO
	{		
		public var caption:String = "Open File";
		public var filter:String = "All Files|*.*||";
		public var multipleSelect:Boolean = false;
		public var path:String = Globals.APPLICATION_START_DIR;
		public var style:String = DialogListViewStyleVO.DETAILS;
		
		public function ShowFileOpenVO()
		{
			super();
		}		
	}
}